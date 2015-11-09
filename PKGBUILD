_pkgname=ruby-tmuxinator
pkgname=ruby-tmuxinator-git
pkgver=0.6.3.r243.g053c35d
pkgrel=1
pkgdesc='Manage complex tmux sessions easily'
url='https://github.com/tmuxinator/tmuxinator'
license=('MIT')
source=("${_pkgname}::git+https://github.com/tmuxinator/tmuxinator.git")
sha256sums=('SKIP')
arch=('any')
depends=('ruby' 'ruby-erubis' 'ruby-thor')
makedepends=('git')
conflicts=('ruby-tmuxinator' 'tmuxinator')
provides=('ruby-tmuxinator' 'tmuxinator')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-
}

build() {
  cd "${srcdir}/${_pkgname}"

  # Build it
  gem build tmuxinator.gemspec
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install the program
  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}$(ruby -e 'puts Gem.default_dir')" \
    -n "${pkgdir}/usr/bin" \
    tmuxinator-*.gem
}

# vim: ft=sh ts=2 sw=2 et
