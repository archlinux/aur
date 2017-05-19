# Maintainer: Jack O'Connor <oconnor663@gmail.com>

# NOTE: This PKGBUILD is generated and pushed by Keybase's release automation.
# Any changes made in aur.archlinux.org git repos will get overwritten. See
# https://github.com/keybase/client/tree/master/packaging/linux/arch.

pkgname=keybase-bin
pkgdesc='the Keybase Go client, filesystem, and GUI'
license=('BSD')
url='https://keybase.io'
pkgver=1.0.23_20170519175207+d6c5e9e
pkgrel=1
arch=('i686' 'x86_64')
depends=(fuse gconf libxss)
# keybase-release is a deprecated AUR package
conflicts=(keybase keybase-release keybase-git)
source_i686=(
  "https://s3.amazonaws.com/prerelease.keybase.io/linux_binaries/deb/keybase_1.0.23-20170519175207.d6c5e9e_i386.deb"
)
source_x86_64=(
  "https://s3.amazonaws.com/prerelease.keybase.io/linux_binaries/deb/keybase_1.0.23-20170519175207.d6c5e9e_amd64.deb"
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
  deb_package="keybase_1.0.23-20170519175207.d6c5e9e_${deb_arch}.deb"
  ar xf "$deb_package"
  tar xf data.tar.xz -C "$pkgdir"

  # Omit the cronjobs that the Debian package includes.
  rm -rf "$pkgdir/etc/cron.daily"
}

sha256sums_i686=(28ee377672b20edda545163a987ac208c66c2aa565eccffd2661ca54eb5d4f85)
sha256sums_x86_64=(b54e5bacb26fbd359f4c4a2c270e4a9d6af81415f392d566e8cf12d32ea7de92)
