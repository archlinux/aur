# Maintainer: Jonathan Brouwer <jonathantbrouwer@gmail.com>

pkgname=spoofax3-jvm-bin
pkgver=0.19.4
pkgrel=1
pkgdesc="Spoofax 3 is a modular and incremental textual language workbench running on the JVM"
arch=('x86_64')
url="https://www.spoofax.dev/spoofax-pie/develop/"
license=('EPL')
depends=(webkit2gtk unzip)
makedepends=(git curl)

pkgurl="https://artifacts.metaborg.org/service/local/repositories/releases/content/org/metaborg/spoofax.lwb.eclipse.repository/$pkgver/spoofax.lwb.eclipse.repository-$pkgver-spoofax3-linux-x86_64-jvm.zip"
# pkgurl="https://artifacts.metaborg.org/service/local/artifact/maven/redirect?r=snapshots&g=org.metaborg&a=spoofax.lwb.eclipse.repository&c=spoofax3-linux-x86_64-jvm&p=zip&v=LATEST"

source=(
    "$pkgname-$pkgver-$pkgrel.zip::$pkgurl"
        "spoofax3.desktop"
)
sha256sums=('988c7cc0b264b6f5158c57dc508f4579acef8c079270d0fdd361ffa4be13a849'
            'a6b57b78b855c00eb36abef337dc9dc439791bb2b0e0c268197b9c2bf0e0aba4')

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
