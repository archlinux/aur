# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='mairu-git'
pkgver=v0.7.0.r5.g329b60c
pkgrel=1
pkgdesc='on-memory AWS credentials agent and executor'
url='https://github.com/sorah/mairu'
depends=('glibc' 'gcc-libs' 'openssl')
makedepends=('rust' 'git')
license=('Apache-2.0')
arch=('x86_64' 'aarch64')
#conflicts=('')
source=('git+https://github.com/sorah/mairu')
md5sums=('SKIP')
_target_name=${pkgname%-git}

pkgver() {
  cd "${srcdir}/${_target_name}"
  git describe --long --tags|sed 's/\([^-]*-g\)/r\1/;s/[-_]/./g;s/^release.//'
}

build() {
  cd "${srcdir}/${_target_name}"
  cargo build --release
}

package() {
  cd "${srcdir}/${_target_name}"
  install -Dm755 "target/release/${_target_name}" "${pkgdir}/usr/bin/${_target_name}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_target_name}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_target_name}/README.md"
}

check() {
  "${srcdir}/${_target_name}"/target/release/${_target_name} --version
}

