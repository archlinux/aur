# Maintainer: James Knight <git@jdknight.me>

pkgname=releng-tool
_pkgpyname=releng_tool
pkgver=2.2.0
_pkgtarget=v2.2
pkgrel=1
pkgdesc='A tool to manage the building of packages'
url=https://releng.io/
arch=(any)
license=(BSD-2-Clause)
depends=(
  python
  python-installer
)
makedepends=(
  python-build
  python-setuptools
  python-wheel
)
optdepends=(
  'autoconf: support for Autotools package management'
  'bash-completion: shell completion for bash'
  'breezy: support for Bazaar cloning'
  'bzr: support for Bazaar cloning'
  'cmake: support for CMake package management'
  'cvs: support for CVS checkouts'
  'dropbear-scp: support for secure-copy fetching of sources'
  'fish: shell completion for fish'
  'git: support for Git cloning'
  'gnupg: support for GPG verification of downloaded packages'
  'make: support for building make-dependent packages'
  'mercurial: support for Mercurial cloning'
  'meson: support for building meson-dependent packages'
  'openssh: support for secure-copy fetching of sources'
  'patch: support for patching package sources'
  'python-build: support for Python packages using build frontend'
  'python-certifi: support using Mozilla'\''s CA Bundle for Bazaar cloning'
  'python-flit: support for Python packages using Flit'
  'python-hatch: support for Python packages using Hatch'
  'python-matplotlib: support for PDF generation of build statistics'
  'python-numpy: support for PDF generation of build statistics'
  'python-pdm: support for Python packages using PDM'
  'python-poetry: support for Python packages using Poetry'
  'python-setuptools: support for Python packages using Setuptools'
  'python-wheel: support for Python packages needing to build an explicit wheel'
  'rsync: support for rsync fetching'
  'rust: support for Cargo package management'
  'scons: support for building SCons-dependent packages'
  'subversion: support for Subversion checkouts'
  'zsh-completions: shell completion for zsh'
)
_base_url=https://github.com/releng-tool/releng-tool/releases/download
source=(
  $_base_url/$_pkgtarget/$_pkgpyname-$pkgver.tar.gz
  $_base_url/$_pkgtarget/$_pkgpyname-$pkgver.tar.gz.asc
)
sha512sums=(
  6ec3d99532770445b629d2174621cea435a21af0533301fede82240babe67fec1491ab8a57753b4936d9b079003e3ab257db7f33a79e536a09d4f88213f4e2cd
  536ef9c7513a74ba34278d49a2d1566e304281667ec4f0f52634172a1374da7e6280b2fa434836bac1d3760707e43f96a95a7bd69ce861c67a4482f6491144d7
)
validpgpkeys=(D04A27BA9305DBBD354E653902D3C27B922CCC13)

build() {
  cd $_pkgpyname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgpyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm644 Documentation/releng-tool.1 \
    "$pkgdir/usr/share/man/man1/releng-tool.1"
  install -vDm644 scripts/completion/bash \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -vDm644 scripts/completion/fish \
    "$pkgdir/usr/share/fish/completions/$pkgname.fish"
  install -vDm644 scripts/completion/zsh \
    "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  install -vDm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
