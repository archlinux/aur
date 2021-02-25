# Maintainer: Franek Madej <franek.madej@gmail.com>
# Completion changes and optdepends by Artemis
pkgname=yadm-git
pkgver=3.0.2.r0.ga5b1067
pkgrel=1
pkgdesc="Yet Another Dotfiles Manager"
arch=('any')
url="https://github.com/TheLocehiliosan/yadm"
license=('GPL3')
makedepends=('git')
optdepends=('gnupg: encrypt/decrypt sensitive files'
            'python-envtpl-git: use templates with variables')
provides=('yadm')
conflicts=('yadm')
source=("${pkgname}::git+https://github.com/TheLocehiliosan/yadm#branch=master")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe  --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${_pkgname}
}

package() {
  cd $srcdir/$pkgname
  install -D -m 755 yadm $pkgdir/usr/bin/yadm
  install -D -m 644 yadm.1 $pkgdir/usr/share/man/man1/yadm.1
  install -D -m 644 completion/bash/yadm "${pkgdir}/usr/share/bash-completion/completions/yadm"
  install -D -m 644 completion/zsh/_yadm "${pkgdir}/usr/share/zsh/site-functions/_yadm"
  install -D -m 644 completion/fish/yadm.fish "${pkgdir}/usr/share/fish/vendor_completions.d/yadm.fish"
}
