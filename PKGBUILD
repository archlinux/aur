# Maintainer: Aditya Sirish <aditya at saky dot in>
# Contributor: Marco Obaid <marco.obaid@gmail.com>

pkgname=oh-my-bash-git
pkgver=r461.dd7807f
pkgrel=1
pkgdesc="A delightful community-driven framework for managing your bash configuration, and an auto-update tool so that makes it easy to keep up with the latest updates from the community"
arch=('x86_64')
url='https://github.com/ohmybash/oh-my-bash'
license=('GPLv2')
depends=('bash')
makedepends=('git')
optdepends=('ruby: for some plugin functionality'
            'curl'
            'wget'
            'python: for some plugin functionality'
            'git: most themes use git (highly recommended but still optional)')

install=${pkgname}.install

source=("${pkgname}::git+${url}"
        '0001-bashrc.patch')

sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  cp "templates/bashrc.osh-template" "bashrc"
  patch -p1 < "${srcdir}/0001-bashrc.patch"
}

package() {
  cd "${srcdir}/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/oh-my-bash"
  install -D -m644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -r * "${pkgdir}/usr/share/oh-my-bash/"
}
