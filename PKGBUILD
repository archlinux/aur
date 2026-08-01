# Maintainer: James Knight <git@jdknight.me>

pkgname=releng-tool
_pkgpyname=releng_tool
pkgver=4.1.0
_pkgtarget=v4.1
pkgrel=1
pkgdesc='A tool to create packages for select runtime environments
 (e.g. embedded targets)'
url=https://releng.io/
arch=(any)
license=(BSD-2-Clause)
depends=(
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=(
  'autoconf: support for Autotools package management'
  'bash-completion: shell completion for bash'
  'breezy: support for Bazaar cloning'
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
  'p4: support for Perforce cloning'
  'python-build: support for Python packages using build frontend'
  'python-certifi: support using Mozilla'\''s CA Bundle for Bazaar cloning'
  'python-flit: support for Python packages using Flit'
  'python-hatch: support for Python packages using Hatch'
  'python-installer: support for installing Python packages'
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
  'waf: support for building Waf-dependent packages'
  'zsh-completions: shell completion for zsh'
)
_base_url=https://github.com/releng-tool/releng-tool/releases/download
source=(
  $_base_url/$_pkgtarget/$_pkgpyname-$pkgver.tar.gz
  $_base_url/$_pkgtarget/$_pkgpyname-$pkgver.tar.gz.asc
)
sha512sums=(
  c64eb5f79494a049966c494eb7931de5e06d70e31cf4fdb3644f126afa10dddc572ce07872f864c56053c8fb1b6b4d633159264c9b70c826cae8090382287dff
  84972215d0c63ce00bbefa87afa2e4e94ff2353b170b3862eb8b8ec7b6f47b8f96450e4e27da022d0cd1622a823fe56470306c69e3effe52706c73240522fafe
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
