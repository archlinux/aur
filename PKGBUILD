# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>

# Repackages the podman-bcachefs artifact published by the bcachefs-storage-driver
# release workflow. Building it from source means compiling podman, which is what
# packaging/arch/PKGBUILD in that repository does.

pkgname=podman-bcachefs-bin
_pkgname=podman-bcachefs
pkgver=6.1.0
pkgrel=1
# pkgrel of the published artifact; independent of this package's pkgrel so an
# AUR-only revision does not break the download URL.
_binrel=1
_reltag=v1.3.0
pkgdesc='A tool for managing OCI containers and pods, with the bcachefs graphdriver compiled in'
arch=('x86_64')
url='https://github.com/ticpu/bcachefs-storage-driver'
license=('Apache-2.0')
depends=(
  catatonit
  conmon
  containers-common
  oci-runtime
  glibc
  nftables
  gpgme libgpgme.so
  libgcc
  libseccomp libseccomp.so
  passt
  shadow
  sqlite
)
optdepends=(
  'apparmor: for AppArmor support'
  'bcachefs-tools: inspect the bcachefs backend subvolumes'
  'btrfs-progs: support btrfs backend devices'
  'fuse-overlayfs: for deprecated storage driver in rootless environment'
  'podlet: Generate Podman Quadlet files from a Podman command, compose file, or existing object'
  'podman-compose: for docker-compose compatibility'
  'podman-desktop: GUI and tray to manage Podman containers (and Kubernetes pods)'
)
provides=("podman=$pkgver" "$_pkgname=$pkgver")
conflicts=(podman "$_pkgname")
backup=(etc/containers/storage.conf.d/00-storage-arch.conf)
options=('!strip' '!debug')
validpgpkeys=('E5998E49DC9E1DCFDB9B46EC77EBA10790CFFCCD')
source=("$_pkgname-$pkgver-$_binrel-$CARCH.pkg.tar.zst::$url/releases/download/$_reltag/$_pkgname-$pkgver-$_binrel-$CARCH.pkg.tar.zst"
        "$_pkgname-$pkgver-$_binrel-$CARCH.pkg.tar.zst.asc::$url/releases/download/$_reltag/$_pkgname-$pkgver-$_binrel-$CARCH.pkg.tar.zst.asc")
sha256sums=('348aec3e8c4d222c1cc9bd3ece59a5b42776d78766c7138a4f47f4a0af6bd563'
            'SKIP')

package() {
  cp -a "$srcdir/etc" "$srcdir/usr" "$pkgdir/"
}
