# Maintainer: James Knight <james.d.knight@live.com>

pkgname=releng-tool
_pkgpyname=releng_tool
pkgver=1.3.0
_pkgtarget=v1.3
pkgrel=1
pkgdesc='A tool to manage the building of packages'
url=https://releng.io/
arch=(any)
license=(BSD-2-Clause)
makedepends=(
  python
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=(
  'autoconf: support for autotools package management'
  'bash-completion: shell completion for bash'
  'bzr: support for Bazaar cloning'
  'cmake: support for CMake package management'
  'cvs: support for CVS checkouts'
  'fish: shell completion for fish'
  'git: support for Git cloning'
  'gnupg: support for GPG verification of downloaded packages'
  'make: support for building make-dependent packages'
  'meson: support for building meson-dependent packages'
  'mercurial: support for Mercurial cloning'
  'openssh: support for secure-copy fetching of sources'
  'patch: support for patching package sources'
  'python-certifi: support using Mozilla'\''s CA Bundle for Bazaar cloning'
  'python-matplotlib: support for PDF generation of build statistics'
  'python-numpy: support for PDF generation of build statistics'
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
  6c9c0e57321a586dd1a8cee206ed4eaf03aa8b86f3e9bf9bada3d24b8e712708b4cfe5fd282f134b1ef6fa7248bb07f8a3bd31d638fa853a70391abf441506f2
  af4bd3e6f4af34b255d67456f02c6ef0754558e4517b9a53a3ba1999beb450ec8c7684d896a68c52ebe4856ab01a9db0c72f9846b785ab8644020317bd29db3d
)
validpgpkeys=(D04A27BA9305DBBD354E653902D3C27B922CCC13)

build() {
  cd $_pkgpyname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgpyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm644 scripts/completion/bash \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -vDm644 scripts/completion/fish \
    "$pkgdir/usr/share/fish/completions/$pkgname.fish"
  install -vDm644 scripts/completion/zsh \
    "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  install -vDm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
