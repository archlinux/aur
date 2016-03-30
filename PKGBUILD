# Maintainer: Simo Leone <leone.simo@gmail.com>
# Submitter: Simo Leone <leone.simo@gmail.com>
pkgname=('google-cloud-compute-image-daemon' 'google-cloud-compute-image-startup-scripts')
pkgbase=google-cloud-compute-image-packages
pkgver=1.3.3
pkgrel=2
pkgdesc="Scripts and tools for Google Compute Engine images."
arch=('any')
url="https://github.com/GoogleCloudPlatform/compute-image-packages"
license=('APACHE')
depends=('python2')
makedepends=()
source=("https://github.com/GoogleCloudPlatform/compute-image-packages/archive/$pkgver.tar.gz")
md5sums=('2ca73ae5aba01b644f2dfe732e84132c')

prepare() {
  cd "compute-image-packages-$pkgver"

  find . -name *.py -print0 | xargs -0 sed -i 's/#!\/usr\/bin\/python/#!\/usr\/bin\/python2/g'
}

build() {
  cd "compute-image-packages-$pkgver"
}

package_google-cloud-compute-image-daemon() {
  pkgdesc="Google daemon runs in the background and manages user accounts, network, ssh keys, and clock."

  cd "compute-image-packages-$pkgver/google-daemon"
  cp -r usr "$pkgdir"
}

package_google-cloud-compute-image-startup-scripts() {
  pkgdesc="Startup scripts that interact with the Google virtual machine environment."

  cd "compute-image-packages-$pkgver/google-startup-scripts"
  cp -r usr "$pkgdir"
  mkdir -p "$pkgdir/usr"
  cp -r lib "$pkgdir/usr"
  mkdir -p "$pkgdir/etc"
  cp -r etc/sysctl.d "$pkgdir/etc"
}
