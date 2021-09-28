# Maintainer: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Tim Brown <stimut@gmail.com>

# For ISSUES, REQUESTS, and QUESTIONS:
# https://github.com/sudoforge/pkgbuilds

pkgname=google-cloud-sdk-app-engine-python
pkgver=359.0.0
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
sha256sums=('36fe25f6a3cf40604b0cd76b53b687b55bbd7f6f17ca61b53b19455649d1c4e3')

package() {
  # Install the component manifest file
  install -D -m 0644 \
    "${srcdir}/google-cloud-sdk/.install/app-engine-python.manifest" \
    "${pkgdir}/opt/google-cloud-sdk/.install/app-engine-python.manifest"

  # Install the component metadata snapshot file
  install -D -m 0644 \
    "${srcdir}/google-cloud-sdk/.install/app-engine-python.snapshot.json" \
    "${pkgdir}/opt/google-cloud-sdk/.install/app-engine-python.snapshot.json"

  # Install the component files
  mkdir -p "${pkgdir}/opt/google-cloud-sdk/platform"
  cp -R \
    "${srcdir}/google-cloud-sdk/platform/google_appengine" \
    "${pkgdir}/opt/google-cloud-sdk/platform/google_appengine"
}
