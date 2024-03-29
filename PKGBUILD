# Maintainer: James Knight <james.d.knight@live.com>

pkgname=releng-tool
pkgver=1.1.0
_pkgtarget=v1.1
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
  8689289ce5b2730270ac7e1c0db9b1a7b39c44f566dff737daabc8b6298806213924f8542af77080dc06c1b0eb3005ccb6ee04f23ec9e32b1cc112e837e9fe39
  c91b42dceec7b753a2bf2b8312158b8143bb76df2863eaf35d105a930e7cf6e62081de3e395adfb618e8ba1287c3e81201576bf13a16b060c4c8f616cb0ca3bd
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
