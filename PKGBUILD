# Maintainer: Jonathan Brouwer <jonathantbrouwer@gmail.com>

pkgname=spoofax3-jvm-bin
pkgver=0.19.2
pkgrel=2
pkgdesc="Spoofax 3 is a modular and incremental textual language workbench running on the JVM"
arch=('x86_64')
url="https://www.spoofax.dev/spoofax-pie/develop/"
license=('EPL')
depends=(webkit2gtk unzip)
makedepends=(git curl)

#pkgurl="https://artifacts.metaborg.org/service/local/repositories/releases/content/org/metaborg/spoofax.lwb.eclipse.repository/$pkgver/spoofax.lwb.eclipse.repository-$pkgver-spoofax3-linux-x86_64-jvm.zip"
pkgurl="https://artifacts.metaborg.org/service/local/repositories/snapshots/content/org/metaborg/spoofax.lwb.eclipse.repository/999.9.9-develop-SNAPSHOT/spoofax.lwb.eclipse.repository-999.9.9-develop-20221005.132513-57-spoofax3-linux-x86_64-jvm.zip"

source=(
    "$pkgname-$pkgver.zip::$pkgurl"
        "spoofax3.desktop"
)
sha256sums=('ff3ee7845eb7ba1a497e0b5987ddc9411bd4ab1056799534210c11616c835b8f'
            '9b29cb76ecff4dbd2f5aa404f8672cc96ca8ade6c41e9eedefe4a8b4f373336e')

build() {
    chmod +x "$srcdir/Spoofax3/jvm/bin/java"
}

package() {
    install -d "${pkgdir}/usr/lib"
    cp -r "Spoofax3" "${pkgdir}/usr/lib/Spoofax3"
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/Spoofax3/eclipse" "${pkgdir}/usr/bin/spoofax3"

    install -Dm0644 "spoofax3.desktop" "${pkgdir}/usr/share/applications/spoofax3.desktop"

    for i in 16 22 24 32 48 64 128 256 512 1024 ; do
      install -Dm0644 Spoofax3/plugins/org.eclipse.platform_*/eclipse$i.png \
          "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/spoofax3.png"
    done
}
