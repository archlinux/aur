# Maintainer: Franek Madej <franek.madej@gmail.com>
# Completion changes and optdepends by Artemis
pkgname=yadm-git
pkgver=1.12.0.r0.g09a018e
pkgrel=1
pkgdesc="Yet Another Dotfiles Manager"
arch=('any')
url="https://github.com/TheLocehiliosan/yadm"
license=('GPL3')
makedepends=('git')
optdepends=('gpg: encrypt/decrypt sensitive files'
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
	install -D -m 644 completion/yadm.bash_completion "${pkgdir}/usr/share/bash-completion/completions/yadm"
	install -D -m 644 completion/yadm.zsh_completion "${pkgdir}/usr/share/zsh/site-functions/_yadm"
}
