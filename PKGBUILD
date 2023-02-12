# Maintainer: James Knight <james.d.knight@live.com>

pkgname=releng-tool
pkgver=0.15.0
_pkgtarget=v0.15
pkgrel=1
pkgdesc='A tool to manage the building of packages'
url=https://releng.io/
arch=(any)
license=(BSD)
makedepends=(
  python
  python-build
  python-installer
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
  616dce613eabfdc347cc5cbf43a8758e264889f67ce1adbeae89311a4329f431b4ce4da3bfa2cd921a6460737b2d5e921add270d2f33734df2523e8b8edeee14
  36d3f213fd1fdbd3b699862b7b920fcd378e60920fdd38750bd8727104d93c84ae2bb411ed60b5704d4730a64403f4196ba8262c2f25b2931f7024a4b192558d
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
