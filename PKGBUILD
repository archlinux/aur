# Maintainer: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Tim Brown <stimut@gmail.com>

pkgname=google-cloud-sdk-app-engine-python-extras
pkgver=314.0.0
pkgrel=1
pkgdesc="A google-cloud-sdk component that provides extra libraries for the Python runtime for AppEngine."
url="https://cloud.google.com/sdk/"
license=("Apache")
arch=('x86_64')
options=('!strip')
depends=(
  "google-cloud-sdk"
  "google-cloud-sdk-app-engine-python"
)
source=(
  "https://dl.google.com/dl/cloudsdk/release/downloads/for_packagers/linux/${pkgname}_${pkgver}.orig.tar.gz"
)
sha256sums=('7d1b1488ff499c5b4c916b33566ac6a61f30a44cff689047e03d096ca0e76d0a')

package() {
  mkdir -p "${pkgdir}/opt/google-cloud-sdk/platform/google_appengine"

  # Install the component manifest file
  install -D -m 0644 \
    "${srcdir}/google-cloud-sdk/.install/app-engine-python-extras.manifest" \
    "${pkgdir}/opt/google-cloud-sdk/.install/app-engine-python-extras.manifest"

  # Install the component metadata snapshot file
  install -D -m 0644 \
    "${srcdir}/google-cloud-sdk/.install/app-engine-python-extras.snapshot.json" \
    "${pkgdir}/opt/google-cloud-sdk/.install/app-engine-python-extras.snapshot.json"

  # Install the component files
  cp -R \
    "${srcdir}/google-cloud-sdk/platform/google_appengine" \
    "${pkgdir}/opt/google-cloud-sdk/platform/google_appengine"
}
