# Maintainer: Your Name <TheExacc@duck.com>
pkgname=script_fetcher_cpp
pkgver=1.0.0
pkgrel=1
pkgdesc="A C++ program that fetches a bash script based on the user query"
arch=('x86_64')
url="https://github.com/TheExacc/Script_collection.git"  # update with your repository URL
license=('MIT')  # update according to your license
depends=('curl')
makedepends=('gcc' 'make' 'nlohmann-json')
source=("git+https://github.com/TheExacc/Script_collection.git")
sha256sums=('SKIP')  # set to 'SKIP' when using a git source

build() {
  cd "$srcdir"
    if [ -d "Script_collection" ]; then
    mv Script_collection script_fetcher_cpp
  fi
  cd "$srcdir/script_fetcher_cpp"
  # Compile the program using g++.
  g++ -std=c++11 -O2 script_fetcher.cpp -lcurl -o script_fetcher_cpp
}

package() {
  cd "$srcdir/script_fetcher_cpp"
  # Install the binary in /usr/bin
  install -Dm755 script_fetcher_cpp "$pkgdir/usr/bin/script_fetcher_cpp"
  
  # Optionally, if you have a README or license file, install those as well.
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

