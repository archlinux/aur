pkgname=turnaur
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple AUR helper written in C#"
arch=('x86_64')
url="https://github.com/turnapps/turnaur"
license=('GPL-3.0-or-later')
depends=('pacman' 'git')
makedepends=('dotnet-sdk')
source=("https://github.com/turnapps/turnaur/releases/download/1.0.0/turnaur-1.0.0.tar.gz")
sha256sums=('d32957edf3a4e71aeddc2ebf22b9f64a96d74d8d25240874df01ea8b2b34c875')
options=('!strip' '!debug')

build() {
    cd "$pkgname-$pkgver"
    dotnet clean
    dotnet publish TurnAUR.csproj -c Release -r linux-x64 -o out
}

package() {
    cd "$pkgname-$pkgver"
    
    install -Dm755 out/turnaur "$pkgdir/usr/bin/turnaur"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
