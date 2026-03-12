# Maintainer: Dae Euhwa <daedaevibin@naver.com>
pkgname=voix
_pkgname=Voix # The case-sensitive name of the repository from git
pkgver=2.3.0
pkgrel=1
pkgdesc="A secure privilege escalation tool replacing sudo/doas, using PAM for authentication"
arch=('x86_64')
url="https://github.com/Veridian-Zenith/Voix"
license=('OSL-3.0')
depends=('pam')
makedepends=('cmake>=3.18' 'clang' 'pkgconf' 'git')
backup=('etc/pam.d/voix' 'etc/voix.conf')
source=("git+https://github.com/Veridian-Zenith/Voix.git")
sha256sums=('SKIP')

# This function generates the version string based on the latest git commit
# It will look like: 2.2.0.r<commit_count>.<short_commit_hash>
pkgver() {
  cd "$_pkgname"
  printf "2.3.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    CC=clang CXX=clang++ cmake -B build -Wno-dev \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$_pkgname"
    DESTDIR="$pkgdir" cmake --install build
}
