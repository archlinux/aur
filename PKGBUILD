# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Kppqju77

pkgname=android-google-apis-x86-64-system-image
pkgver=30_r05
pkgrel=1
pkgdesc='Android with Google APIs x86_64 Atom System Image, latest API'
arch=('any')
url='https://software.intel.com/en-us/android/tools'
license=('custom')
depends=('android-platform')
optdepends=('qemu' 'libvirt')
provides=("${pkgname}-${pkgver/_*/}")
conflicts=("${pkgname}-${pkgver/_*/}")
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/sys-img/google_apis/x86_64-${pkgver}.zip"
        "package.xml")
sha256sums=('aa0b2383ed3c8a03b7a06fdde499b7753a1640a6d1e57a17661e6be1a818af89'
            '9c8fbb06c55912d6bb486d347b3d448acb8f45995cf8f351c038400c68e8b76e')

prepare() {
  # Fix permissions
  cd 'x86_64'
  find . -type f -print0 | xargs --null chmod -R u=rw,go=r
  find . -type d -print0 | xargs --null chmod -R u=rwx,go=rx
}

package() {
  # Install files
  install -d -m 755 "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis"
  cp -r 'x86_64' "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis/"
  # Install license
  install -D -m 644 "package.xml" "${pkgdir}/usr/share/licenses/${pkgname}/package.xml"
  ln -s "/usr/share/licenses/${pkgname}/package.xml" \
    "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis/x86_64/"
}
