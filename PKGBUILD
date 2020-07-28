# This is the Rescribe AUR PKGBUILD file.
# For more information, see 'man PKGBUILD'.
# Maintainer: Rescribe <rescribe.dev@gmail.com>

pkgname=rescribe
pkgver=0.0.13
pkgrel=1
epoch=
pkgdesc="code search engine cli"
arch=("x86_64")
url="https://rescribe.dev"
license=("CC-BY-NC-SA-4.0")
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=("!strip")
install=$pkgname.install
changelog=
source=("https://cli.rescribe.dev/linux.zip")
noextract=()
md5sums=("8c7735e688fdbacfd8e192a256f7ffad")
validpgpkeys=()

package() {
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/bin"
  mv rescribe "$pkgdir/usr/bin"
  mv nodegit.node "$pkgdir/usr/bin"

  start_completions_str="begin-rescribe-completions"

  default_shell=$(getent passwd $USER | sed 's:.*/::')
  shell_rc_file=~/."$default_shell""rc"

  if [ -f $shell_rc_file ] && ! grep -q "$start_completions_str" "$shell_rc_file"; then
    echo "adding completion"
    bash "$pkgdir/usr/bin/rescribe" completion >> ~/.bashrc
  fi
}
