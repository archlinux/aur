# Maintainer: Danilo <aur ät dbrgn döt ch>
# Original submitter: Eduardo Parra Mazuecos<eduparra90@gmail.com>

pkgname=nodejs-socket-cli-js
_npmname=@socketsecurity/cli
_npmname_short=cli
pkgver=0.14.67
pkgrel=1
pkgdesc="The Socket CLI tool"
arch=("any")
url="https://github.com/SocketDev/socket-cli/"
license=("MIT")
depends=("nodejs")
makedepends=("npm" "python" "python-setuptools")
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname_short}-${pkgver}.tgz")
noextract=("${_npmname_short}-${pkgver}.tgz")
sha256sums=("3d1882886b35e2b4c7ec080f5ced2542f4f1795b8d371e4abc87227af16660ca")

package() {
  # Install package
  npm install -g --omit=dev --omit=optional --prefix "${pkgdir}/usr" "${srcdir}/${_npmname_short}-${pkgver}.tgz"

  # Install license
  licensedir="${pkgdir}/usr/share/licenses/${pkgname}/"
  mkdir -p "$licensedir"
  tar xf "${srcdir}/${_npmname_short}-${pkgver}.tgz" --strip-components=1 -C "${licensedir}" package/LICENSE
  chmod 644 "${licensedir}/LICENSE"

  # Remove manpages
  find "${pkgdir}" -type f -name "*.1" -delete
  find "${pkgdir}" -type f -name "*.1.txt" -delete
}
