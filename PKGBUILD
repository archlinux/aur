# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=android-google-apis-x86-system-image
pkgver=29_r07
pkgrel=1
pkgdesc='Android with Google APIs x86 Atom System Image, latest API'
arch=('any')
url='https://software.intel.com/en-us/android/tools'
license=('custom')
depends=('android-platform')
optdepends=('qemu' 'libvirt')
provides=("${pkgname}-${pkgver/_*/}")
conflicts=("${pkgname}-${pkgver/_*/}")
options=('!strip')
source=("https://dl.google.com/android/repository/sys-img/google_apis/x86-${pkgver}-linux.zip"
        "package.xml")
sha256sums=('a62570c1953848c7ca177a63bb7e0547214fc1ff946012e7d3a3b45168c6b507'
            '627f5180506b8a17992309068afe047345909f9d528088854180bc5b9ff10c5d')

prepare() {
  # Fix permissions
  cd 'x86'
  find . -type f -print0 | xargs --null chmod -R u=rw,go=r
  find . -type d -print0 | xargs --null chmod -R u=rwx,go=rx
}

package() {
  # Install files
  install -d -m 755 "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis"
  cp -r 'x86' "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis/"
  # Install license
  install -D -m 644 "package.xml" "${pkgdir}/usr/share/licenses/${pkgname}/package.xml"
  ln -s "/usr/share/licenses/${pkgname}/package.xml" \
    "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis/x86/"
}
