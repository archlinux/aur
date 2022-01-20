# Maintainer: Alec Mev <alec@mev.earth>

pkgname=asdf-vm
pkgver=0.9.0
pkgrel=1
pkgdesc='Extendable version manager with support for Ruby, Node.js, Elixir, Erlang & more'
arch=('any')
url='https://asdf-vm.com'
license=('MIT')
depends=(
  'curl'
  'git'
)
optdepends=(
  'autoconf'
  'automake'
  'bash-completion: For completions to work in Bash'
  'libffi'
  'libtool'
  'libxslt'
  'libyaml'
  'ncurses'
  'openssl'
  'readline'
  'unixodbc'
  'unzip: Needed by some plugins, like Elixir'
)
install=asdf-vm.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/asdf-vm/asdf/archive/v${pkgver}.tar.gz")
sha256sums=('f2ab54bf1d17e10f17e405c2fac29f0620a66b5c7a5200b5699e50e28ed210c8')

package() {
  cd "asdf-${pkgver}"

  local dst="${pkgdir}/opt/${pkgname}"
  mkdir -p "${dst}"

  cp -r bin         "${dst}"
  cp -r lib         "${dst}"
  cp    asdf.elv    "${dst}"
  cp    asdf.fish   "${dst}"
  cp    asdf.sh     "${dst}"
  cp    defaults    "${dst}"
  cp    help.txt    "${dst}"
  cp    LICENSE     "${dst}"
  cp    version.txt "${dst}"

  local usrshare="${pkgdir}/usr/share"
  local docdir="${usrshare}/doc/${pkgname}"
  mkdir -p "${docdir}"

  cp docs/[^_]*.md     "${docdir}"
  cp ballad-of-asdf.md "${docdir}"
  cp help.txt          "${docdir}"
  cp CHANGELOG.md      "${docdir}"
  cp CONTRIBUTING.md   "${docdir}"
  cp README.md         "${docdir}"
  cp SECURITY.md       "${docdir}"

  install -Dm644 -t "${usrshare}/licenses/${pkgname}/" LICENSE

  cd completions

  install -Dm644 asdf.bash "${usrshare}/bash-completion/completions/asdf"
  install -Dm644 asdf.fish "${usrshare}/fish/vendor_completions.d/asdf.fish"
  install -Dm644 _asdf     "${usrshare}/zsh/site-functions/_asdf"
}
