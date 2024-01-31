# Maintainer: tuberry

pkgname=fortune-mod-gushiwen-git
_pkg=fortune-zh-data
pkgver=r2.00d7cec
pkgrel=2
pkgdesc="Chinese gushiwen for fortune-mod"
url="https://github.com/shenyunhang/$_pkg"
license=(GPL-3.0-or-later)
depends=(fortune-mod)
makedepends=(git)
provides=(fortune-mod-gushiwen)
conflicts=(fortune-mod-gushiwen)
source=("git+$url")
md5sums=(SKIP)
arch=(any)

pkgver() {
  cd "$_pkg"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package(){
  cd "$_pkg"
  declare -A dynasty=(
    [先秦]=Qin
    [两汉]=Han
    [魏晋]=Wei
    [隋代]=Sui
    [唐代]=Tang
    [五代]=Five
    [宋代]=Song
    [金朝]=Jin
    [元代]=Yuan
    [明代]=Ming
    [清代]=Qing
    [近代]=Recent
    [现代]=Modern
    [未知]=Unknown
    [南北朝]=SN
  )
  fortune="$pkgdir"/usr/share/fortune
  install -dm755 "$fortune"
  for name in "${!dynasty[@]}"; do
    install -Dm644 "$name" "$fortune/${dynasty[$name]}"
    install -Dm644 "$name.dat" "$fortune/${dynasty[$name]}.dat"
  done
}

# vim: ts=2 sw=2 et:
