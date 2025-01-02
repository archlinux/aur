# Maintainer: KostyaTheSon <konstantinkorovajcev@outlook.com>
pkgname=huawei-unlockboot
pkgver=0.1
pkgrel=1
epoch=0

# Description of the package
pkgdesc="A tool to unlock the bootloader of Huawei or Honor devices even if the code can't be found."

# Architecture supported by this package
arch=('x86_64')

# URL of the project
url="https://github.com/Martazza/Huawei-Bootloader-Unlocker"

# License under which the package is released
license=('MIT')

# Groups this package belongs to (optional)
groups=(base-devel)

# Dependencies required to run this package
depends=(gcc android-tools)

build() {
  # Clone the repository if it doesn't exist
  if [ ! -d "$srcdir/$pkgname" ]; then
      git clone https://github.com/Martazza/Huawei-Bootloader-Unlocker.git "$srcdir/$pkgname"
  fi

  # Change into the source directory
  cd "$srcdir/$pkgname"

  # Compile the program
  gcc huawei_bootloader_unlocker.c -o huawei-unlockboot

  # Make the executable executable
  chmod +x huawei-unlockboot
}

package() {
  # Install the compiled binary
  install -Dm755 "$srcdir/$pkgname/huawei-unlockboot" "$pkgdir/usr/bin/huawei-unlockboot"
}

