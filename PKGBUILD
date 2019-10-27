# Maintainer: deadc0de6 <info@deadc0de.ch>

pkgname=dotdrop
pkgver=0.29.5
pkgrel=1
pkgdesc="Save your dotfiles once, deploy them everywhere "
arch=('any')
url="https://github.com/deadc0de6/dotdrop"
license=('GPL')
groups=()
depends=('python' 'python-setuptools' 'python-jinja' 'python-docopt' 'python-ruamel-yaml')
makedepends=('git')
source=("git+https://github.com/deadc0de6/dotdrop.git#tag=v${pkgver}")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --abbrev=0 --tags | sed 's/^v//g'
}

package() {
  cd "${pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 completion/dotdrop-completion.bash "${pkgdir}/usr/share/bash-completion/completions/dotdrop"
  install -Dm644 completion/dotdrop.sh-completion.bash "${pkgdir}/usr/share/bash-completion/completions/dotdrop.sh"

  install -Dm644 completion/_dotdrop-completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_dotdrop"
  install -Dm644 completion/_dotdrop.sh-completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_dotdrop.sh"
}

