# Maintainer: Forest Crossman <cyrozap at gmail dot com>
# Contributor: David Manouchehri <manouchehri@riseup.net>

pkgname=bindiff
pkgver=8
pkgrel=1
pkgdesc="A comparison tool for binary files that assists vulnerability researchers and engineers to quickly find differences and similarities in disassembled code."
arch=('x86_64')
url="https://www.zynamics.com/bindiff.html"
license=('Apache')  # NOTE: Despite being released as open source, the GUI can't be built from source as it depends on a proprietary graph visualization library.
depends=('desktop-file-utils' 'java-runtime>=11')
options=('!strip')
install=${pkgname}.install
backup=("etc/opt/${pkgname}/bindiff.json")
source=("https://github.com/google/bindiff/releases/download/v${pkgver}/bindiff_${pkgver}_amd64.deb"{,.asc})
sha256sums=('821990e3974a9df6733794370e485486ac276ba5d777a06b4ebe575f092f4dda'
            'SKIP')
validpgpkeys=('EB4C1BFD4F042F6DDDCCEC917721F63BD38B4796')  # Google Inc. (Linux Packages Signing Authority)

package() {
  # Extract
  tar -xJf data.tar.xz --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Remove the bundled Java runtime
  rm -r "${pkgdir}"/opt/bindiff/jre

  # Write install location to config file
  sed -i 's/^\( "directory": "\)\(",\)/\1\/opt\/bindiff\/\2/' "${pkgdir}"/etc/opt/bindiff/bindiff.json
}

# vim:set et sw=2 sts=2 tw=80:
