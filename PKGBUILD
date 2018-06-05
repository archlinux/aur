# Maintainer: Jack O'Connor <oconnor663@gmail.com>

# NOTE: This PKGBUILD is generated and pushed by Keybase's release automation.
# Any changes made in aur.archlinux.org git repos will get overwritten. See
# https://github.com/keybase/client/tree/master/packaging/linux/arch.

pkgname=keybase-bin
pkgdesc='the Keybase Go client, filesystem, and GUI'
license=('BSD')
url='https://keybase.io'
pkgver=2.1.0_20180605160111+8044871b01
src_prefix=https://s3.amazonaws.com/prerelease.keybase.io/linux_binaries/deb
deb_pkgver="${pkgver/_/-}"
deb_pkgver="${deb_pkgver/+/.}"
pkgrel=1
arch=('i686' 'x86_64')
depends=(fuse gconf libxss gtk2) # don't change this without changing the SRCINFO template too
# keybase-release is a deprecated AUR package
conflicts=(keybase keybase-release keybase-git)
source_i686=(
  "${src_prefix}/keybase_${deb_pkgver}_i386.deb"
)
source_x86_64=(
  "${src_prefix}/keybase_${deb_pkgver}_amd64.deb"
)
install=keybase.install

package() {
  if [ "$CARCH" = "i686" ] ; then
    deb_arch="i386"
  elif [ "$CARCH" = "x86_64" ] ; then
    deb_arch="amd64"
  else
    echo "Unknown arch: $CARCH"
    exit 1
  fi

  cd "$srcdir"
  deb_package="keybase_${deb_pkgver}_${deb_arch}.deb"
  ar xf "$deb_package"
  tar xf data.tar.xz -C "$pkgdir"

  # Omit the cronjobs that the Debian package includes.
  rm -rf "$pkgdir/etc/cron.daily"
}

# You can cross reference these hashes with Keybase Debian repo metadata:
# https://prerelease.keybase.io/deb/dists/stable/main/binary-amd64/Packages
# https://prerelease.keybase.io/deb/dists/stable/main/binary-i386/Packages
sha256sums_i686=(aa159374013d498f8e8a71712679673568fb2b94189194501e54b784060d4336)
sha256sums_x86_64=(7228a5bd51ebffd0194645a69062bcd520a687ed9c6074c7e9d2c7e40680887a)
