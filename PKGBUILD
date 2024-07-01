# Maintainer: James Knight <james.d.knight@live.com>

pkgname=releng-tool
_pkgpyname=releng_tool
pkgver=1.2.0
_pkgtarget=v1.2
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
  'bzr: supporting for Bazaar cloning'
  'cmake: support for CMake package management'
  'cvs: supporting for CVS checkouts'
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
  'scons: support for building SCons-dependent packages'
  'subversion: supporting for Subversion checkouts'
  'zsh-completions: shell completion for zsh'
)
_base_url=https://github.com/releng-tool/releng-tool/releases/download
source=(
  $_base_url/$_pkgtarget/$_pkgpyname-$pkgver.tar.gz
  $_base_url/$_pkgtarget/$_pkgpyname-$pkgver.tar.gz.asc
)
sha512sums=(
  1a2d5d916c3e505d32c6e79b1052743dbdb7eb0fc3a5249b5f309c760ffc5bf4bafcc4261fbdfab725b5adf4c4c2235c771cb1f3049de02d8f284d742b996c5a
  5873ec342c37e5e27b7d8a28d61b0eeb634b40afb210fb164e374a0888f9526bb5449030da9efe8efb83578fcf88e8c442b8250de868ec028b824744f7a45d61
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
