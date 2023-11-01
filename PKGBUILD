# Maintainer : Ivo(sh) Musil <ivoshm@gmail.com>
# Contributor: archplayer
# Contributor: RemiliaForever <remilia AT koumakan DOT cc>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Christoph Drexler <chrdr at gmx dot at>
# Contributor: Jelle van der Waa <jellevdwaa@gmail.com>
# Contributor: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>

GTK_VERSION=3
JAVA_PATH='/usr/lib/jvm/java-8-openjdk/bin/java'

pkgname=xmind8
pkgver=8.update9
pkgrel=2
pkgdesc="Brainstorming and Mind Mapping Software (legacy version based on Eclipse)"
arch=('x86_64')
url="https://www.xmind.net/xmind8-pro/"
license=('EPL' 'LGPL')
depends=('java-runtime>=8')
optdepends=(
    'gtk2: gtk2 or gtk3 must be installed'
    'gtk3: gtk2 or gtk3 must be installed'
    'lame: needed for audio notes'
)
provides=('xmind')
conflicts=('xmind')
install=xmind8.install
source=(
    "https://www.xmind.net/xmind/downloads/xmind-${pkgver/./-}-linux.zip"
    'XMind'
    'xmind.desktop'
    'xmind.xml'
    'xmind.png'
    'xmind_file.png'
)
sha256sums=('835f7eaa93e2b7d52f44f02324089363ed65a61e0713e01652871143becb070e'
            '0ec1dac54d0bd8e01e7a2219da52cbbf261dfdd3cbdc1cb50650a0803f6ff6de'
            '7d6cfdee51d72626c5d945debb4371ef8d758c8a0c4e5c2b547cbd7e552ac00a'
            'cc8dccb4710d924d0f3198770705272bfa222dc6926826c975c881e87f081419'
            'ae20c41ebe708603cc303c3241a816a229bcbcc3a2435381a7092783a313b84b'
            '7015cda79ee9844f370687b9532b892ebe607969170e6f3fd414e259b181e5ba')

package() {
    mkdir -p $pkgdir/usr/share/xmind
    cp -r $srcdir/XMind_amd64   $pkgdir/usr/share/xmind/XMind
    cp -r $srcdir/configuration $pkgdir/usr/share/xmind/
    cp -r $srcdir/features      $pkgdir/usr/share/xmind/
    cp -r $srcdir/plugins       $pkgdir/usr/share/xmind/
    cp $srcdir/*.xml            $pkgdir/usr/share/xmind/

    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    cp $srcdir/{epl-v10,lgpl-3.0}.html $pkgdir/usr/share/licenses/$pkgname/
    cp $srcdir/xpla.txt                $pkgdir/usr/share/licenses/$pkgname/

    mkdir -p $pkgdir/usr/share/fonts/xmind
    cp -r $srcdir/fonts $pkgdir/usr/share/fonts/xmind/

    mkdir -p $pkgdir/usr/share/applications
    cp $srcdir/xmind.desktop $pkgdir/usr/share/applications/

    mkdir -p $pkgdir/usr/share/mime/packages
    cp $srcdir/xmind.xml $pkgdir/usr/share/mime/packages/

    mkdir -p $pkgdir/usr/share/pixmaps
    cp $srcdir/*.png $pkgdir/usr/share/pixmaps/

    mkdir -p $pkgdir/usr/bin
    cp $srcdir/XMind $pkgdir/usr/bin/

    sed -i "s|^./configuration$|@user.home/.xmind/configuration|" $pkgdir/usr/share/xmind/XMind/XMind.ini
    sed -i "s|^../workspace$|@user.home/.xmind/workspace|" $pkgdir/usr/share/xmind/XMind/XMind.ini
    sed -i "s|^2$|$GTK_VERSION|" $pkgdir/usr/share/xmind/XMind/XMind.ini
    sed -i "s|^-vmargs$|-vm\n$JAVA_PATH\n-vmargs|" $pkgdir/usr/share/xmind/XMind/XMind.ini
}
