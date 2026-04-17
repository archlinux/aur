# Me is just a random anon from the internet. I'm not related to prism in any way
# Contact about package issues tho. <bjoel2@i2pmail.org>

pkgname="prismlauncher-themes-git"
pkgver=2025.06.06_1749223820.r2.g3b87732
pkgrel=1
pkgdesc="PrismLauncher themes from their official github"
arch=('any')
url="https://github.com/PrismLauncher/Themes"
license=('Apache-2.0 AND CC-BY-4.0 AND CC-BY-SA-4.0 AND CC0-1.0 AND GPL-3.0-or-later AND MIT AND Unlicense')
makedepends=('git')
optdepends=('prismlauncher')
source=("${pkgname}::git+https://github.com/PrismLauncher/Themes.git")
sha256sums=('SKIP')
install='themes.install'

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

package() {
  cd "${pkgname}"
  install --mode=644 -Dt "$pkgdir/usr/share/licenses/$pkgname" LICENSES/MIT.txt
  mkdir "${pkgdir}/usr/share/prismlauncher-themes"
  cd themes
  for themeDir in *
  do
    cp -r "$themeDir" "${pkgdir}/usr/share/prismlauncher-themes/${themeDir}"
  done
}
