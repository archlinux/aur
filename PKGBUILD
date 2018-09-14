# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname=repos

pkgname=repos-git
pkgver=r59.c945048
pkgrel=1
pkgdesc="A simple command tool to manage local repositories"
url="https://github.com/zhangkaizhao/repos"
makedepends=('cargo')
optdepends=('git: Git support'
            'mercurial: Mercurial(hg) support')
arch=('x86_64')
license=('MIT' 'Apache')
conflicts=('repos')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -m755 target/release/repos "${pkgdir}/usr/bin/repos"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -m644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
  install -D -m644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
  install -D -m644 doc/repos.1 "${pkgdir}/usr/share/man/man1/repos.1"
}
