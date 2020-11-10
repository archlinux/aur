_pkgname=tree-sitter
pkgname=$_pkgname-langauges-git
pkgver=ca69cdf.8ece09c.99151b1.35863bf.fb8250e.23f2cb9.dadfd9c.7f442e1.f7b62ac.3d9fe97.77e7785.d3976b2.6a0863f.4ec9ee4.b0c0367.c4282ba.a0d688d.be2e415.df5e502.cf47ff8.211bb72.73afadb
pkgrel=0
pkgdesc='An incremental parsing system for programming tools'
arch=('x86_64')
url='https://github.com/tree-sitter/tree-sitter'
license=('MIT')
provides=('tree-sitter-languages')
conflicts=('tree-sitter-agda'
           'tree-sitter-bash'
           'tree-sitter-c'
           'tree-sitter-c-sharp'
           'tree-sitter-cpp'
           'tree-sitter-css'
           'tree-sitter-go'
           'tree-sitter-html'
           'tree-sitter-java'
           'tree-sitter-javascript'
           'tree-sitter-jsdoc'
           'tree-sitter-json'
           'tree-sitter-julia'
           'tree-sitter-ocaml'
           'tree-sitter-php'
           'tree-sitter-python'
           'tree-sitter-ql'
           'tree-sitter-regex'
           'tree-sitter-ruby'
           'tree-sitter-rust'
           'tree-sitter-scala'
           'tree-sitter-typescript')
depends=('tree-sitter')
makedepends=('git' 'cargo' 'npm' 'emscripten')
source=("git+https://github.com/tree-sitter/tree-sitter-agda"
        "git+https://github.com/tree-sitter/tree-sitter-bash"
        "git+https://github.com/tree-sitter/tree-sitter-c"
        "git+https://github.com/tree-sitter/tree-sitter-c-sharp"
        "git+https://github.com/tree-sitter/tree-sitter-cpp"
        "git+https://github.com/tree-sitter/tree-sitter-css"
        "git+https://github.com/tree-sitter/tree-sitter-go"
        "git+https://github.com/tree-sitter/tree-sitter-html"
        "git+https://github.com/tree-sitter/tree-sitter-java"
        "git+https://github.com/tree-sitter/tree-sitter-javascript"
        "git+https://github.com/tree-sitter/tree-sitter-jsdoc"
        "git+https://github.com/tree-sitter/tree-sitter-json"
        "git+https://github.com/tree-sitter/tree-sitter-julia"
        "git+https://github.com/tree-sitter/tree-sitter-ocaml"
        "git+https://github.com/tree-sitter/tree-sitter-php"
        "git+https://github.com/tree-sitter/tree-sitter-python"
        "git+https://github.com/tree-sitter/tree-sitter-ql"
        "git+https://github.com/tree-sitter/tree-sitter-regex"
        "git+https://github.com/tree-sitter/tree-sitter-ruby"
        "git+https://github.com/tree-sitter/tree-sitter-rust"
        "git+https://github.com/tree-sitter/tree-sitter-scala"
        "git+https://github.com/tree-sitter/tree-sitter-typescript")
sha512sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
            'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
            'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  for language in agda bash c c-sharp cpp css go html java javascript jsdoc json julia ocaml php python ql regex ruby rust scala typescript;do
    cd tree-sitter-$language
    if [ $language = typescript ];then
      printf "%s" $(git rev-parse --short HEAD)
    else
      printf "%s." $(git rev-parse --short HEAD)
    fi
    cd - >/dev/null
  done
}

package() {
  mkdir -p "$pkgdir"/usr/lib/

  for language in agda bash c c-sharp cpp css go html java javascript jsdoc json julia ocaml/ocaml ocaml/interface php python ql regex ruby rust scala typescript/tsx typescript/typescript;do
    echo $language
    cd tree-sitter-${language}/src
    clang -std=c99 -fPIC parser.c -c
    clang -shared parser.o -o "$pkgdir"/usr/lib/tree-sitter-$(echo ${language}|sed 's|/|-|').so
    mkdir -p "$pkgdir"/usr/share/tree-sitter/${language}/
    cp grammar.json node-types.json "$pkgdir"/usr/share/tree-sitter/${language}
    cd - >/dev/null
  done

}
