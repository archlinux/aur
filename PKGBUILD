# Maintainer: souk4711
#
# shellcheck disable=SC2034,SC2148,SC2154,SC2164

_gemname=ruby-qt6-qtquickwidgets
pkgname=$_gemname
pkgver=6.3.0
pkgrel=1
pkgdesc="Ruby Bindings for Qt Quick Widgets."
arch=("x86_64")
url="https://github.com/souk4711/ruby-qt6"
license=("LGPL-3.0-only WITH LGPL-3.0-linking-exception")
depends=(
  "ruby"
  "ruby-qt6-rice>=6.3.0"
  "ruby-qt6-qtcore"
  "ruby-qt6-qtgui"
  "ruby-qt6-qtwidgets"
  "ruby-qt6-qtqml"
  "ruby-qt6-qtquick"
  "qt6-declarative"
)
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('96db28b5c5e6d8900085163f4e847b3a6695d51b857a3c38150c2f0f8e2c715b')

build() {
  local _gemdir
  _gemdir="$(gem env gemdir)"

  export RUBYQT6_CXXFLAGS="-Os -fno-fast-math -flto=auto"
  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$_gemdir" \
    "$_gemname-$pkgver.gem"
}

package() {
  local _gemdir
  _gemdir="$(gem env gemdir)"

  cp --archive --verbose tmp_install/* "${pkgdir}"
  install --verbose -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
