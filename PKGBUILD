# Maintainer: Ray Donnelly <mingwandroid@gmail.com>

pkgname=msys2-pacman-mirrors
pkgver=20221016
pkgrel=2
pkgdesc="MSYS2 mirror list for use by pacman"
arch=('any')
url="https://www.msys2.org/dev/mirrors/"
license=('GPL')
source=(mirrorlist.msys
        mirrorlist.mingw)
sha256sums=('f105e99b174b409dbcec37d0e5e7473b22092cdbf5cd52ef9c5943f62b955017'
            '9bf93b4feeddcfc788fee17965dc6339f91d4fc3059812a9b3bc349e6bde0065')
backup=(
  'etc/pacman.d/mirrorlist.msys'
  'etc/pacman.d/mirrorlist.mingw'
  'etc/pacman.d/mirrorlist.mingw32'
  'etc/pacman.d/mirrorlist.mingw64'
  'etc/pacman.d/mirrorlist.ucrt64'
  'etc/pacman.d/mirrorlist.clang64'
  'etc/pacman.d/mirrorlist.clang32'
)
package() {
  mkdir -p ${pkgdir}/etc/pacman.d
  install -m644 ${srcdir}/mirrorlist.msys ${pkgdir}/etc/pacman.d/
  install -m644 ${srcdir}/mirrorlist.mingw ${pkgdir}/etc/pacman.d/

  # For backwards compatibility
  install -m644 ${srcdir}/mirrorlist.mingw ${pkgdir}/etc/pacman.d/mirrorlist.mingw32
  sed -s 's|$repo|i686|g' -i ${pkgdir}/etc/pacman.d/mirrorlist.mingw32
  install -m644 ${srcdir}/mirrorlist.mingw ${pkgdir}/etc/pacman.d/mirrorlist.mingw64
  sed -s 's|$repo|x86_64|g' -i ${pkgdir}/etc/pacman.d/mirrorlist.mingw64
  install -m644 ${srcdir}/mirrorlist.mingw ${pkgdir}/etc/pacman.d/mirrorlist.ucrt64
  sed -s 's|$repo|ucrt64|g' -i ${pkgdir}/etc/pacman.d/mirrorlist.ucrt64
  install -m644 ${srcdir}/mirrorlist.mingw ${pkgdir}/etc/pacman.d/mirrorlist.clang64
  sed -s 's|$repo|clang64|g' -i ${pkgdir}/etc/pacman.d/mirrorlist.clang64
  install -m644 ${srcdir}/mirrorlist.mingw ${pkgdir}/etc/pacman.d/mirrorlist.clang32
  sed -s 's|$repo|clang32|g' -i ${pkgdir}/etc/pacman.d/mirrorlist.clang32
}
