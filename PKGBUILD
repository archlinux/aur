# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>

pkgname='refind-theme-regular-git'
pkgver='r26.3e2f6ac'
pkgrel=1
pkgdesc="A simplistic clean and minimal theme for rEFInd"
arch=('any')
url="https://github.com/munlik/refind-theme-regular"
license=('AGPL3' 'custom:OFL' 'custom:Ubuntu Font License 1.0')
depends=('refind-efi')
makedepends=('git')
source=('git+https://github.com/munlik/refind-theme-regular')
md5sums=('SKIP')

_name=${pkgname%-git}

pkgver() {
  cd "${srcdir}/${_name}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  local refind_home="${pkgdir}/boot/EFI/refind"

  mkdir -p "${refind_home}"
  cp -r "${srcdir}/${_name}" "${refind_home}"
  chmod -R 644 "${refind_home}/${_name}"

  echo 'Remember to add "include refind-theme-regular/theme.conf" to your refind.conf file'
}
