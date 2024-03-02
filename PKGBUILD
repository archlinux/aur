# Maintainer: James Knight <james.d.knight@live.com>

pkgname=releng-tool
pkgver=1.0.0
_pkgtarget=v1.0
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
  $_base_url/$_pkgtarget/releng-tool-$pkgver.tar.gz
  $_base_url/$_pkgtarget/releng-tool-$pkgver.tar.gz.asc
)
sha512sums=(
  ece80d6528f64c28673dc33f00f092a9d5f9843e0ae4a95de07575da509bb72f2e478e56b3bc8ef9fb2f0d7e1215a85793d8918bf6aed48ac01cf90c3b12afef
  9718801dd8f885f9f52365b680130822add8bffc4084b7a136a9fbef69b462ada883f5b8d6d01942545cc866908f602bcf78f70ba2fd2186706d00c140cbeb8f
)
validpgpkeys=(D04A27BA9305DBBD354E653902D3C27B922CCC13)

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm644 scripts/completion/bash \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -vDm644 scripts/completion/fish \
    "$pkgdir/usr/share/fish/completions/$pkgname.fish"
  install -vDm644 scripts/completion/zsh \
    "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  install -vDm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
