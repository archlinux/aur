# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Sébastien Luttringer

pkgname=xdg-utils-git
pkgver=1.1.1.r9.g6acfbbe
pkgrel=1
pkgdesc='Command line tools that assist applications with a variety of desktop integration tasks (git version)'
url='http://www.freedesktop.org/wiki/Software/xdg-utils/'
arch=('any')
license=('MIT')
conflicts=('xdg-utils')
provides=('xdg-utils')
depends=('sh' 'xorg-xset')
makedepends=('docbook-xsl' 'lynx' 'xmlto')
optdepends=('kde-cli-tools: for KDE Plasma5 support in xdg-open'
            'libgnome: for GNOME support in xdg-open'
            'exo: for Xfce support in xdg-open'
            'xorg-xprop: for Xfce support in xdg-open'
            'pcmanfm: for LXDE support in xdg-open'
            'perl-file-mimeinfo: for generic support in xdg-open')
source=('git+http://anongit.freedesktop.org/git/xdg/xdg-utils.git')
md5sums=('SKIP')

pkgver() {
    cd ${pkgname%-git}
    git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

build() {
    cd ${pkgname%-git}
    ./configure --prefix=/usr --mandir=/usr/share/man
    make
}

package() {
    cd ${pkgname%-git}
    make DESTDIR="${pkgdir}" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	
    # install empty directory to prevent xdg-desktop-menu install *.desktop to fail, see FS#33316
    install -dm755 $pkgdir/usr/share/desktop-directories
}
