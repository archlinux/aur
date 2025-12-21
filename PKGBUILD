# Maintainer: Moksh Malde <maldemoksh437@gmail.com>

pkgname=reconsage-git
pkgver=1.9.0
pkgrel=1
pkgdesc="Advanced passive reconnaissance framework with WAF, rate-limit and fingerprint detection"
arch=('any')
url="https://github.com/moksh-codedeveloper/Recon_sage"
license=('MIT')

depends=(
  'python'
  'python-fastapi'
  'python-httpx'
  'python-rich'
  'python-requests'
  'python-dnspython'
  'python-pydantic'
  'python-uvicorn-loguru-integration-git'  # fixed uvicorn dependency
)

makedepends=('git' 'python-pip')  # git is needed for VCS source

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ReconSage
  git describe --long --tags --dirty --always 2>/dev/null \
    | sed 's/^v//;s/-/./g'
}

build() {
  cd ReconSage
}

package() {
  cd ReconSage

  install -d "$pkgdir/usr/lib/reconsage"
  cp -r . "$pkgdir/usr/lib/reconsage"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/reconsage/main.py "$pkgdir/usr/bin/reconsage"
}
