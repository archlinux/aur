# Maintainer: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Tim Brown <stimut@gmail.com>

pkgname=google-cloud-sdk-app-engine-python
pkgver=320.0.0
pkgrel=1
pkgdesc="A google-cloud-sdk component that provides the Python runtime for AppEngine."
url="https://cloud.google.com/sdk/"
license=("Apache")
arch=('x86_64')
options=('!strip')
depends=(
  "google-cloud-sdk"
  "python2"
)
source=(
  "https://dl.google.com/dl/cloudsdk/release/downloads/for_packagers/linux/${pkgname}_${pkgver}.orig.tar.gz"
)
sha256sums=('0ad39aa5eef9e8b17cd3ff310e81af3e5d1b84a726d3c6206201890c13da61d7')

package() {
  mkdir -p "${pkgdir}/opt/google-cloud-sdk/platform/google_appengine"

  # Install the component manifest file
  install -D -m 0644 \
    "${srcdir}/google-cloud-sdk/.install/app-engine-python.manifest" \
    "${pkgdir}/opt/google-cloud-sdk/.install/app-engine-python.manifest"

  # Install the component metadata snapshot file
  install -D -m 0644 \
    "${srcdir}/google-cloud-sdk/.install/app-engine-python.snapshot.json" \
    "${pkgdir}/opt/google-cloud-sdk/.install/app-engine-python.snapshot.json"

  # Install the component files
  cp -R \
    "${srcdir}/google-cloud-sdk/platform/google_appengine" \
    "${pkgdir}/opt/google-cloud-sdk/platform/google_appengine"
}
