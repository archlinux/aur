# Maintainer: Koragg <31944041+KoraggKnightWolf@users.noreply.github.com>
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Hugo Posnic <huluti@manjaro.org>

pkgname=archlinux-hello
pkgver=0.8.2
pkgrel=1
pkgdesc="A tool providing access to documentation and support for new Arch Linux users."
url="https://github.com/KoraggKnightWolf/archlinux-hello"
arch=('any')
license=('GPL')
depends=('gtk3' 'python-gobject')
makedepends=('git')
#optdepends=('calamares: universal installer framework')
replaces=('manjaro-welcome')
conflicts=('manjaro-welcome' 'manjaro-hello')
#source=("$url/archive/$pkgver.tar.gz")
#md5sums=('03762487fde986419b3416699b34dbec')
source=("git+$url.git")
md5sums=('SKIP')


#pkgver() {
#    cd $pkgname
#    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

prepare() {
    mv $pkgname $pkgname-$pkgver
}

package() {
    cd $pkgname-$pkgver
    install -dm755 $pkgdir/usr/share/$pkgname
    cp -r data $pkgdir/usr/share/$pkgname
    cp -r ui $pkgdir/usr/share/$pkgname
    install -Dm644 $pkgname.desktop $pkgdir/etc/skel/.config/autostart/$pkgname.desktop
    install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    install -Dm644 data/img/archlinux.png $pkgdir/usr/share/icons/hicolor/64x64/apps/archlinux.png
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
    install -Dm644 CHANGELOG.md $pkgdir/usr/share/doc/$pkgname/CHANGELOG.md
    install -Dm755 src/archlinux_hello.py $pkgdir/usr/bin/$pkgname

    cd po
    for lang in $(ls *.po); do
      lang=${lang::-3}
      install -dm755 $pkgdir/usr/share/locale/${lang//_/-}/LC_MESSAGES
      msgfmt -c -o $pkgdir/usr/share/locale/${lang//_/-}/LC_MESSAGES/$pkgname.mo $lang.po
    done
}
