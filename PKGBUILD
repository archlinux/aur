# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=android-google-apis-playstore-x86-64-system-image
pkgver=30_r10
pkgrel=1
pkgdesc='Android with Google APIs and Play Store x86_64 Atom System Image, latest API'
arch=('any')
url='https://developer.android.com/studio/index.html'
license=('custom')
depends=('android-platform')
optdepends=('qemu' 'libvirt')
provides=("${pkgname}-${pkgver/_*/}")
conflicts=("${pkgname}-${pkgver/_*/}")
options=('!strip')
source=("${pkgname}-${pkgver}.zip"::"http://dl.google.com/android/repository/sys-img/google_apis_playstore/x86_64-${pkgver}-linux.zip"
        "package.xml")
sha256sums=('361305a1af81937c82af3d0bf22bbc7da0bebd46e5c004debd5cdcf36550ffdd'
            'f497278dc6dd861f54101a1858c1717594f4c3e2deefd2ae19a380ef0df8f8bd')

prepare() {
  # Fix permissions
  cd 'x86_64'
  find . -type f -print0 | xargs --null chmod -R u=rw,go=r
  find . -type d -print0 | xargs --null chmod -R u=rwx,go=rx
}

package() {
  # Install files
  install -d -m 755 "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis_playstore"
  cp -r 'x86_64' "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis_playstore/"
  # Install license
  install -D -m 644 "package.xml" "${pkgdir}/usr/share/licenses/${pkgname}/package.xml"
  ln -s "/usr/share/licenses/${pkgname}/package.xml" \
    "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis_playstore/x86_64/"
}
