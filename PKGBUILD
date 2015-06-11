# Maintainer:  jyantis <yantis@yantis.net>

pkgname=autoenv-git
pkgver=1.0.0.r102.c4bc3f5
pkgrel=2
pkgdesc='Directory based enviroments'
arch=('any')
url='https://github.com/kennethreitz/autoenv'
license=('custom')
source=('git+https://github.com/kennethreitz/autoenv.git')
sha256sums=('SKIP')
depends=('bash')
optdepends=('zsh: if you prefer zsh over bash')
install='autoenv.install'
makedepends=('git')
conflicts=('autoenv')

pkgver() {
  cd autoenv
  set -o pipefail
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||

  # If there is a setup.py then pull the version tag from the file
  if [ -f "setup.py" ]; then
    printf "%s." "$(grep -R "version=" setup.py | awk -F\' '{print $2}')"
  fi

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd autoenv

  install -D -m755 activate.sh "${pkgdir}/usr/share/${pkgname}/activate.sh"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
