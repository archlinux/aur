# Maintainer: Thaodan <AUR+me@thaodan.de>

pkgname=obs-service-tar-git
pkgver=0.6.2
pkgrel=1
pkgdesc="tar_git service designed for packing up git trees"
arch=('any')
url="https://github.com/MeeGoIntegration/obs-service-tar-git"
license=('GPL2')
groups=('obs')
depends=(
  # git is the primary tool used
  git
  # the script is written in bash
  bash
  # for tar, compress sources
  tar
  # in case .bz2 is used in .spec
  pbzip2
  # in case .gz is used in .spec
  pigz
  # in case .xz is used in .spec
  xz
  # for find and xargs
  findutils
  # for all standard utils
  coreutils
  # gawk and awk is used in the script as well as sed
  gawk
  sed
  # for flock
  util-linux
  # rsync and curl is used in download_files section
  rsync
  curl
  # git-lfs is used to cache and clone LFS git objects
  git-lfs
)

optdepends=('obs-service-repo: Synchronise sources that include a git-repo manifest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MeeGoIntegration/obs-service-tar-git/archive/$pkgver.tar.gz")
sha512sums=('5d9d7d879e953a9253576559e7d3ebaa28fbe94bec5cc9f15c860c123009e9d35ce99450cfd1df1e6693a0071eaffdc631a1537ecdca250c27c34eb44f03a89c')


package() {
  cd "$pkgname-$pkgver"
  install -Dm755 tar_git ${pkgdir}/usr/lib/obs/service/tar_git
  install -m644 tar_git.service ${pkgdir}/usr/lib/obs/service/tar_git.service
}
