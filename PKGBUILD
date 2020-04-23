# Maintainer: Olegs Jeremejevs <olegs@jeremejevs.com>

pkgname=asdf-vm
pkgver=0.7.8
pkgrel=4
pkgdesc='Extendable version manager with support for Ruby, Node.js, Elixir, Erlang & more'
arch=('any')
url='https://asdf-vm.com'
license=('MIT')
depends=(
  'autoconf'
  'automake'
  'libffi'
  'libtool'
  'libxslt'
  'libyaml'
  'ncurses'
  'openssl'
  'readline'
  'unixodbc'
)
optdepends=('unzip: Needed by some plugins, like Elixir')
install=asdf-vm.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/asdf-vm/asdf/archive/v${pkgver}.tar.gz")
sha256sums=('6225d822a189ab02f88e2afa9f46c52cb876885ea21b56827e564f73c99369d3')

package() {
  cd "asdf-${pkgver}"

  local dst="${pkgdir}/opt/${pkgname}"
  mkdir -p "${dst}"

  cp -r bin         "${dst}"
  cp -r completions "${dst}"
  cp -r lib         "${dst}"
  cp    asdf.fish   "${dst}"
  cp    asdf.sh     "${dst}"
  cp    defaults    "${dst}"
  cp    help.txt    "${dst}"
  cp    LICENSE     "${dst}"
  cp    VERSION     "${dst}"

  local usrshare="${pkgdir}/usr/share"

  install -Dm 644 -t "${usrshare}/licenses/${pkgname}/" LICENSE

  cd completions

  install -Dm 644 asdf.bash "${usrshare}/bash-completion/completions/asdf"
  install -Dm 644 asdf.fish "${usrshare}/fish/vendor_completions.d/asdf.fish"
  install -Dm 644 _asdf     "${usrshare}/zsh/site-functions/_asdf"
}
