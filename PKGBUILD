# Maintainer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Matt Harrison <matt@mistbyte.com>

_pkgname=ruby-haste
pkgname=ruby-haste-git
pkgver=latest
pkgrel=1
pkgdesc='Simple client for uploading text to a haste-server (hastebin) (development version)'
url='https://github.com/seejohnrun/haste-client'
license=('MIT')
source=("${_pkgname}::git+https://github.com/seejohnrun/haste-client.git")
sha256sums=('SKIP')
arch=('any')
depends=('ruby' 'ruby-json')
makedepends=('git')
conflicts=('ruby-haste')
provides=('ruby-haste')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  # Build it!
  gem build haste.gemspec
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install the program.
  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}$(ruby -e 'puts Gem.default_dir')" \
    -n "${pkgdir}/usr/bin" \
    haste-*.gem
}

# vim: ft=sh ts=2 sw=2 et
