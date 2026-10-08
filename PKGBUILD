# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>

# Repackages the podman-bcachefs artifact published by the bcachefs-storage-driver
# release workflow. Building it from source means compiling podman, which is what
# packaging/arch/PKGBUILD in that repository does.

pkgname=podman-bcachefs-bin
_pkgname=podman-bcachefs
pkgver=6.1.2
pkgrel=1
# pkgrel of the published artifact; independent of this package's pkgrel so an
# AUR-only revision does not break the download URL.
_binrel=1
_reltag=v1.6.0
pkgdesc='A tool for managing OCI containers and pods, with the bcachefs graphdriver compiled in'
arch=('x86_64' 'aarch64')
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
_dl="$url/releases/download/$_reltag"
# The tag in the local name keeps a cached artifact from an older release from
# being reused when a new release republishes the same filename.
source_x86_64=("$_pkgname-$pkgver-$_binrel-$_reltag-x86_64.pkg.tar.zst::$_dl/$_pkgname-$pkgver-$_binrel-x86_64.pkg.tar.zst"
               "$_pkgname-$pkgver-$_binrel-$_reltag-x86_64.pkg.tar.zst.asc::$_dl/$_pkgname-$pkgver-$_binrel-x86_64.pkg.tar.zst.asc")
source_aarch64=("$_pkgname-$pkgver-$_binrel-$_reltag-aarch64.pkg.tar.zst::$_dl/$_pkgname-$pkgver-$_binrel-aarch64.pkg.tar.zst"
                "$_pkgname-$pkgver-$_binrel-$_reltag-aarch64.pkg.tar.zst.asc::$_dl/$_pkgname-$pkgver-$_binrel-aarch64.pkg.tar.zst.asc")
sha256sums_x86_64=('bcece0f339bf322ddf14d296ef02d6512d5b833bf7beee71ff3c47e901c37c6d'
                   'SKIP')
sha256sums_aarch64=('274f4a17a36c911133f5baeec2bb37ff4b2727226e04e06b834da9ede638eaa1'
                    'SKIP')

package() {
  cp -a "$srcdir/etc" "$srcdir/usr" "$pkgdir/"
}
