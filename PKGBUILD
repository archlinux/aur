# Maintainer: Jonathan Brouwer <jonathantbrouwer@gmail.com>

pkgname=spoofax3-jvm-bin
pkgver=0.15.3
pkgrel=1
epoch=0
pkgdesc="Spoofax 3 is a modular and incremental textual language workbench running on the JVM"
arch=('x86_64')
url="https://www.spoofax.dev/spoofax-pie/develop/"
license=('EPL')
groups=()
depends=(webkit2gtk unzip)
source=("$pkgname-$pkgver.zip::https://artifacts.metaborg.org/service/local/artifact/maven/redirect?r=releases&g=org.metaborg&a=spoofax.lwb.eclipse.repository&c=spoofax3-linux-x86_64-jvm&p=zip&v=$pkgver"
        "spoofax3.desktop")
noextract=()
sha256sums=('004a74f52c50e68138857e1fe1f801ac49fb65b972fddc8b10aa7a16eb135e55'
            '847631857773b444d0fb6d56818ff15156f9e59b3e5b5786f6702b40b578859f')
validpgpkeys=()

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
          "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/eclipse.png"
    done
}
