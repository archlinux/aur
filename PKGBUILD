# Maintainer: amesgen <amesgen AT amesgen DOT de>

pkgname='dhall-yaml-bin'
pkgver=1.2.9
pkgrel=1
pkgdesc="Dhall to YAML compiler and a YAML to Dhall compiler"
arch=('x86_64')
url='https://github.com/dhall-lang/dhall-haskell'
license=('GPL3')
conflicts=('dhall-yaml')

_dhall_ver=1.40.2

source=("dhall-yaml-$_dhall_ver-$pkgver.tar.bz2::https://github.com/dhall-lang/dhall-haskell/releases/download/$_dhall_ver/dhall-yaml-$pkgver-x86_64-linux.tar.bz2")
sha256sums=('a4cc5618078853044a75134975c87f8dc9bff7af46a65986f49bb894160ce3f4')

package() {
  for f in dhall-to-yaml-ng yaml-to-dhall; do
    install -Dm755 "$srcdir/bin/$f" -t "$pkgdir/usr/bin/"
    _install_completion_script $f bash bash-completion/completions/$f
    _install_completion_script $f zsh zsh/site-functions/_$f
    _install_completion_script $f fish fish/vendor_completions.d/$f.fish
  done
}

_install_completion_script() {
  install -Dm644 <("$pkgdir/usr/bin/$1" --$2-completion-script "/usr/bin/$1") "$pkgdir/usr/share/$3"
}
