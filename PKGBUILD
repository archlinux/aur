# Maintainer: ra1nb0w <rainbow@irh.it>

pkgname=gtkterm
pkgver=1.3.0
pkgrel=2
pkgdesc="A gtk+ based serial port communication program"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/Jeija/gtkterm"
license=('GPL3')
depends=('gtk3' 'vte3' 'libgudev')
makedepends=('meson' 'ninja')
conflicts=('gtkterm')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz" "fix_pointer.patch")
sha256sums=('cd311605633cabd5759adee7eebc2fbd8d8f1de627f377a17a28498279ee5caa'
            '450de640bcf4cea3e546c3b9a6388537748f7ebdeae31b54fdde1d1f8e2f4d26')
install="${pkgname}.install"

prepare() {
    # temporary; remove with next release
    patch --directory="$pkgname-$pkgver" --forward --strip=1 --input="${srcdir}/fix_pointer.patch"
}

build()
{
    cd "${pkgname}-${pkgver}"
    meson --prefix=/usr --buildtype=plain build
    meson compile -C build
}

package()
{
    cd "${pkgname}-${pkgver}"
    meson install -C build --destdir "$pkgdir"
}


