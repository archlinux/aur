# --- META BİLGİLER ---
pkgname=repoforge-git                                                               # Paketin adı (küçük harf, boşluk yok)
pkgver=0.1.1                                                                        # Versiyon (GitHub tag'iyle AYNI olmalı)
pkgrel=1                                                                            # Paket revizyonu (yeni versiyon = 1'e sıfırla)
pkgdesc="A C++ wizard to create linux remote repositories for debian, RHEL and AUR" # Paketin ne yaptığı (80 karakter max)
arch=('x86_64')                                                                     # Mimari (derlenen kod = x86_64, script = any)
url="https://github.com/Vniverse77/byte-knight"                                     # Proje ana sayfası
license=('GPL-3.0-or-later')                                                        # Lisans türü
depends=('glibc' 'gcc-libs')                                                        # Çalışması için gereken paketler
makedepends=('gcc')                                                                 # Derlenmesi için gereken paketler
optdepends=( # İsteğe bağlı bağımlılıklar
  'dpkg: for .deb packages'
  #'rpm-tools: for .rpm packages'
)

# --- KAYNAK KOD ---
source=("$pkgname-$pkgver.tar.gz::https://github.com/Vniverse77/byte-knight/archive/v$pkgver.tar.gz")
sha256sums=('efa3a40c690bfae0b6c41eb098b48a77ee55727a52b9fe85935e056551d409ea')
build() {
  cd "byte-knight-$pkgver" # Tarball açılınca oluşan klasör adı
  g++ -std=c++17 -O2 -Wl,-z,relro,-z,now -o repoforge-git src/repoForge.cpp -lpthread
}

# --- KURULUM ---
package() {
  cd "byte-knight-$pkgver"
  install -Dm755 repoforge-git "$pkgdir/usr/bin/repoforge-git"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
