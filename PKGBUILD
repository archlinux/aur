# Maintainer: Jack O'Connor <oconnor663@gmail.com>

# NOTE: This PKGBUILD is generated and pushed by Keybase's release automation.
# Any changes made in aur.archlinux.org git repos will get overwritten. See
# https://github.com/keybase/client/tree/master/packaging/linux/arch.

pkgname=keybase-bin
pkgdesc='the Keybase Go client, filesystem, and GUI'
license=('BSD')
url='https://keybase.io'
pkgver=2.3.0_20180627160031+8e0438e6fb
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
sha256sums_i686=(a3976fe93116c1afbf9dee2f874cf9f4f4c0564a93a0c08a15fc01a1f32fdaa6)
sha256sums_x86_64=(ddb941bb445b20be93afc67b786fe38d1d0594bbba95e31d07fbd5e69aec5d75)
