# Maintainer: Franklyn Tackitt <franklyn@tackitt.net>

pkgname=v8-3.14-bin
pkgver=3.14.5.8
pkgrel=3
pkgdesc='v8 3.14 binary package from ubuntu xenial'
url='https://github.com/v8/v8'
arch=('x86_64')
license=('BSD')
depends=()
makedepends=()
conflicts=('v8-3.14')
provides=('v8-3.14')

source=("https://mirrors.kernel.org/ubuntu/pool/universe/libv/libv8-3.14/libv8-3.14.5_${pkgver}-5ubuntu2_amd64.deb"
        "https://mirrors.kernel.org/ubuntu/pool/universe/libv/libv8-3.14/libv8-dev_${pkgver}-5ubuntu2_amd64.deb")
noextract=("libv8-3.14.5_${pkgver}-5ubuntu2_amd64.deb" "libv8-dev_${pkgver}-5ubuntu2_amd64.deb")
sha512sums=('18a0ca972b8a3b8ba1171bf763876d2ef2b1577496457b04dfec78efb84992093181a42576cf5ab1c84cabe446ad9726f0713a5355779c865351ecc12b6f2b5b'
            'e8c2a179b7400a82da762dbe4f166de1dfc2da84afbbf35cd110739852a97ec62558e49f23868854ea85981d54553754ed37b00d50cf702bdd6a29cf5333545c')

prepare() {
  msg2 "Unpacking libv8-3.14.5_${pkgver}-5ubuntu2_amd64.deb"
  ar p "libv8-3.14.5_${pkgver}-5ubuntu2_amd64.deb" data.tar.xz | tar Jx

  msg2 "Unpacking libv8-dev_${pkgver}-5ubuntu2_amd64.deb"
  ar p "libv8-dev_${pkgver}-5ubuntu2_amd64.deb" data.tar.xz | tar Jx
}

package() {
  install -Dm755 "${srcdir}/usr/lib/libv8.so.3.14.5"        -t "${pkgdir}/usr/lib/"
  install -Dm644 "${srcdir}/usr/share/doc/libv8-dev/copyright" "${pkgdir}/usr/share/licenses/v8-3.14/LICENSE"

  for file in "${srcdir}/usr/share/doc/libv8-dev/examples/"* "${srcdir}/usr/include/"*; do
    install -Dm644 "$file" "${file/$srcdir/$pkgdir}"
  done
}

