# Maintainer: SpaciousCoder78 <aryankmmiv@outlook.com>
pkgname=quickoverflow
pkgver=3.0.0
pkgrel=1
pkgdesc="A CLI Tool to auto-detect code errors and open solutions"
arch=('x86_64')
url="https://github.com/SpaciousCoder78/QuickOverflow"
license=('GPL3')
depends=('python')
makedepends=('python-pipenv' 'python-pip' 'gcc')
source=("https://github.com/SpaciousCoder78/QuickOverflow/releases/download/v3.0.0/QuickOverflow3.0.0.tar.gz")
md5sums=('3812a9438f234df57e26f75a7b9e4dc1')

build() {
    cd "$srcdir/pyoverflow-cli"
    if [[ -f Pipfile ]]; then
        pipenv install --python python3
        pipenv run pip install -r requirements.txt
        pipenv install pyinstaller
    fi

    gcc main.c -o quickoverflow
    chmod +x search.py
    pipenv run pyinstaller --onefile --name search search.py
}

package() {
    cd "$srcdir/pyoverflow-cli"
    sudo install -Dm755 quickoverflow "/usr/local/bin/quickoverflow"
    sudo install -Dm755 dist/search "/usr/local/bin/search"
}