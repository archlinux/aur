# Maintainer: Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>

pkgname=python-sphinxcontrib-youtube-git
pkgver=r23.98f8caf
pkgrel=1
# pacman -Ss python-sphinxcontrib | grep -v commu | sort
pkgdesc="Sphinx extension for including YouTube and Vimeo videos"
arch=(any)
url=https://github.com/sphinx-contrib/youtube
# https://github.com/sphinx-contrib/youtube/blob/635c8a908e3cac552ce43293c1516e7270cc4ce8/MANIFEST.in#L2
# https://github.com/sphinx-contrib/youtube/blob/635c8a908e3cac552ce43293c1516e7270cc4ce8/sphinxcontrib/__init__.py#L10
# https://github.com/sphinx-contrib/youtube/blob/86aa0ba318bcef8112df7b86f226479b16ed9feb/setup.py#L18
license=(custom:BSD)
depends=("python-sphinx>=0.6")
makedepends=(git python-setuptools)
source=(${pkgname%-*}::git+https://github.com/sphinx-contrib/youtube.git)
md5sums=(SKIP)

# prepare() {
#   :
# }

pkgver() {
  cd ${pkgname%-*}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-*}
  grep distutils  setup.py && /bin/false
  grep setuptools setup.py
  python3 setup.py build
}

package() {
  cd ${pkgname%-*}
  export PYTHONHASHSEED=0
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
