# Maintainer: Michael Düll <mail@akurei.me> 
pkgname=catlateral-damage
pkgver=5.2a
pkgrel=1
#epoch=
pkgdesc="Play as a cooped-up cat where your paw is your only weapon and mischief-making is your only directive."
arch=('i686' 'x86_64')
url="http://www.catlateraldamage.com/"
license=('custom:Freeware')
groups=()
depends=('glu' 'gtk2')
source=("http://www.catlateraldamage.com/releases/v${pkgver}/CatlateralDamage_v{$pkgver}_Linux.tar.gz"
        'catlateral-damage')

package() {
    cd "${srcdir}/Linux"
    if [ "$CARCH" = "x86_64" ]; then
        rm "CatlateralDamage_v${pkgver}.x86"
        mv "CatlateralDamage_v${pkgver}.x86_64" "CatlateralDamage_v${pkgver}.bin"
        find "CatlateralDamage_v${pkgver}_Data" -ignore_readdir_race -mindepth 1 -name "x86" -type d -print0 | xargs -0 /bin/rm -rf
    else
        rm "CatlateralDamage_v${pkgver}.x86_64"
        mv "CatlateralDamage_v${pkgver}.x86" "CatlateralDamage_v${pkgver}.bin"
        find "CatlateralDamage_v${pkgver}_Data" -ignore_readdir_race -mindepth 1 -name "x86_64" -type d -print0 | xargs -0 /bin/rm -rf
    fi
    
    chmod +x "CatlateralDamage_v${pkgver}.bin"
    install -dm755 "${pkgdir}/opt/${pkgname}/"
    cp -r * "${pkgdir}/opt/${pkgname}/"

    install -d "${pkgdir}/usr/bin/"
    install -m755 -t "${pkgdir}/usr/bin/" "${srcdir}/catlateral-damage"
}
sha512sums=('61953b36536a742fc04a3efa5463320442ab1031317820de946eabb359e487db4314fd8cbda807855e39418438443c74e9ccdf6b2c028fc34eb3010f0e6f353d'
            'be314e728ab388c9adc30198ffcae7351dc9ced88b7bad7c48d97fd55d1bf70bcd7a42cccb105e2176e62cdbd06d4df09c57978f89c3268f5f81b0c7d903539b')
